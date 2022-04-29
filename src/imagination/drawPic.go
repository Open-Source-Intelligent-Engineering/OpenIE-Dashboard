package main

import (
	"fmt"
	"image"
	"image/color"
	"image/jpeg"
	"log"
	"os"
)

const (
	dx = 500
	dy = 200
)

func main() {

	file, err := os.Create("test.jpeg")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	alpha := image.NewAlpha(image.Rect(0, 0, dx, dy))
	for x := 0; x < dx; x++ {
		for y := 0; y < dy; y++ {
			alpha.Set(x, y, color.Alpha{uint8(x % 256)}) //设定alpha图片的透明度
		}
	}

	fmt.Println(alpha.At(400, 100))    //144 在指定位置的像素
	fmt.Println(alpha.Bounds())        //(0,0)-(500,200)，图片边界
	fmt.Println(alpha.Opaque())        //false，是否图片完全透明
	fmt.Println(alpha.PixOffset(1, 1)) //501，指定点相对于第一个点的距离
	fmt.Println(alpha.Stride)          //500，两个垂直像素之间的距离
	jpeg.Encode(file, alpha, nil)      //将image信息写入文件中
}
