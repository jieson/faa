<?php
namespace addons\ygame\service;

use app\admin\model\ygame\Cert;

class Result
{

    public $model;

    public function __construct()
    {
        $this->model = new \app\admin\model\ygame\Result();
    }


    /**
     * 获取成绩查询列表
     * @param $name
     * @param $idcard
     * @return array
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function scanResultList($name,$idcard){
        $count = $this->model
            ->alias("result")
            ->join("ygame_project project","project.id=result.project_id")
            ->where(['result.name'=>$name,'result.idcard'=>$idcard])
            ->order("result.id desc")
            ->count();

        $data = $this->model
            ->alias("result")
            ->field("result.id,result.name,result.rank,result.group,result.code,result.result,project.project_name")
            ->join("ygame_project project","project.id=result.project_id")
            ->where(['result.name'=>$name,'result.idcard'=>$idcard])
            ->order("result.id desc")
            ->select();

        return ['total'=>$count,'data'=>$data];
    }

    /**
     * 生成成绩证书
     */
    public function general_cert($result_id){

        try {
            $resultModel = new \app\admin\model\ygame\Result();
            if(!$resultInfo = $resultModel->where(['id'=>$result_id])->find()){
                $this->error = "当前记录不存在";
                return false;
            }
            $certModel = new Cert();
            if(!$certInfo = $certModel->where(['project_id'=>$resultInfo['project_id']])->find()){
                $this->error = "当前证书不存在，请联系管理员";
                return false;
            }

            $dst_path = $certInfo['image'];
            //创建图片的实例
            $dst = imagecreatefromstring(file_get_contents(getcwd().$dst_path));

            $fields = json_decode($certInfo['fields']);
            //打上文字
            $font = getcwd().'/assets/addons/ygame/fonts/song.ttf';//字体路径
            $color = self::hex2rgb($certInfo['color']);
            $black = imagecolorallocate($dst, $color['r'], $color['g'], $color['b']);//字体颜色

            foreach($fields as $k=>$v){
                $value = $resultInfo[$v->field];
                imagefttext($dst, $certInfo['fontsize']*1.55, 0,  intval($v->left)*2, intval($v->top)*2+$certInfo['fontsize']*1.55+10, $black, $font, $value);
            }

            $filepath = "uploads/ygame/".date("YmdHis")."/";
            $filename = $filepath.$result_id.".jpg";
            if(!file_exists($filepath)){
                @mkdir($filepath,0775,true);
            }
            imagejpeg($dst,$filename);
            imagedestroy($dst);

            return $filename;
        }catch (\Exception $e){
            $this->error = $e->getMessage();
            return false;
        }


    }

    function hex2rgb($hexColor){
        $color=str_replace('#','',$hexColor);
        if (strlen($color)> 3){
            $rgb=array(
                'r'=>hexdec(substr($color,0,2)),
                'g'=>hexdec(substr($color,2,2)),
                'b'=>hexdec(substr($color,4,2))
            );
        }else{
            $r=substr($color,0,1). substr($color,0,1);
            $g=substr($color,1,1). substr($color,1,1);
            $b=substr($color,2,1). substr($color,2,1);
            $rgb=array(
                'r'=>hexdec($r),
                'g'=>hexdec($g),
                'b'=>hexdec($b)
            );
        }
        return $rgb;
    }

}