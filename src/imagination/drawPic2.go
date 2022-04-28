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

	file, err := os.Create("test.jpg")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()
	rgba := image.NewRGBA(image.Rect(0, 0, dx, dy))
	for x := 0; x < dx; x++ {
		for y := 0; y < dy; y++ {
			rgba.Set(x, y, color.NRGBA{uint8(x % 256), uint8(y % 256), 0, 255})
		}
	}

	fmt.Println(rgba.At(400, 100))    //{144 100 0 255}
	fmt.Println(rgba.Bounds())        //(0,0)-(500,200)
	fmt.Println(rgba.Opaque())        //true，其完全透明
	fmt.Println(rgba.PixOffset(1, 1)) //2004
	fmt.Println(rgba.Stride)          //2000
	jpeg.Encode(file, rgba, nil)      //将image信息存入文件中
}
