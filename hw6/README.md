# COSE312 - HW6

## 과제 설명

### 과제 기한

2020.06.28. 23:59

### 설명

인터벌 분석(Interval Analysis)을 이용하여 프로그램에 존재하는 배열 넘침(buffer overflow) 오류를 사전에 모두 검출하거나 없으면 없다고 검증해 주는 프로그램 분석기를 구현해 봅시다. s.ml에 정의된 언어를 대상으로 합니다.

입력으로 S 프로그램을 받아서 배열 넘침 오류가 발생하지 않음을 검증하는데 성공하면 true, 실패하면 false를 반환하는 analyzer.ml의 함수 verify를 작성하세요.

``` OCaml
verify : S.program -> bool
```

참고로 `verify`는 S 프로그램을 입력으로 받지만 이를 동일한 의미를 가지는 T 프로그램으로 변환하여 분석해도 됩니다.
(T 프로그램을 이용하여 분석한다면, `Translator.translate`를 `verify`에서 호출하십시오.)

이번 과제에서는 분석기의 속도도 채점에 고려합니다. 최대 소요 시간은 5초 입니다. 분석 비용이 5초를 넘으면 false를 반환하고 종료하세요.
(`Sys.time` 을 참고하세요. [참고링크](https://caml.inria.fr/pub/docs/manual-ocaml/libref/Sys.html))

## 빌드 방법

### 빌드

본 저장소의 `build` file을 terminal에서 실행하면 전체 program이 build 됩니다.

``` bash
$ ./build
Finished, 25 targets (0 cached) in 00:00:00.

real    0m0.000s
user    0m0.000s
sys     0m0.000s
```

### 실행

Build 후 생성된 `main.native` file을 terminal에서 실행하면 s program에 대한 결과가 출력됩니다.

``` bash
$ ./main.native ./test/bo1.s
== source program ==
{
 int i;
 int[1000] a;
 while i<1000  {
  i = i+1;
 }

 a[i] = 1;
}
== analyze the program ==
...
== execute the source program ==
...
```

## Library 이용

본 과제에서는 `Batteries` library를 이용 가능합니다.
[참고링크](https://ocaml-batteries-team.github.io/batteries-included/hdoc2/)

### 설치 방법

Batteries 사용을 위해 패키지를 먼저 설치해야 합니다.

``` bash
$ opam install batteries
...
```

### 사용 방법

`BatList`, `BatSet`, ... 등의 module을 사용하기 위해,

module 이름과 함께 module의 함수를 사용하거나

``` OCaml
...

let len a = BatList.length a

...
```

program의 상단에 `open BatList` 등을 적시하여 사용할 수 있습니다.

``` OCaml
open BatList

...

let len a = length a

...
```
