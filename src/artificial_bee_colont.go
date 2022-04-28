package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	var (
		n, m, k int
		a, b    []int
		c       [][]int
		d       []int
	)
	fmt.Scan(&n, &m, &k)
	a = make([]int, n)
	b = make([]int, m)
	for i := 0; i < n; i++ {
		fmt.Scan(&a[i])
	}
	for i := 0; i < m; i++ {
		fmt.Scan(&b[i])
	}
	c = make([][]int, n)
	for i := 0; i < n; i++ {
		c[i] = make([]int, m)
	}
	for i := 0; i < n; i++ {
		for j := 0; j < m; j++ {
			fmt.Scan(&c[i][j])
		}
	}
	d = make([]int, k)
	for i := 0; i < k; i++ {
		fmt.Scan(&d[i])
	}
	fmt.Println(solve(a, b, c, d))
}

func solve(a, b []int, c [][]int, d []int) int {
	var (
		n, m, k int
		ans     int
	)
	n = len(a)
	m = len(b)
	k = len(d)
	for i := 0; i < n; i++ {
		for j := 0; j < m; j++ {
			if c[i][j] == 1 {
				ans += a[i] * b[j]
			}
		}
	}
	for i := 0; i < k; i++ {
		ans -= d[i]
	}
	return ans
}
