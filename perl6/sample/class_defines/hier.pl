#!/usr/bin/env perl6

use v6;

class C11              { method f {say "C11"} }
class C12              { method f {say "C12"} }
class C21              { method f {say "C21"} }
class C22              { method f {say "C22"} }
class B1 is C11 is C12 { method f {say "B1"} }
class B2 is C21 is C22 { method f {say "B2"} }
class A  is B1  is B2  { method f {say "A"} }

my $obj_c = A.new;
say $obj_c.WHAT; # A()
say $obj_c.^parents(:tree).perl; # ([B1, [C11, [Any, [Mu]]], [C12, [Any, [Mu]]]], [B2, [C21, [Any, [Mu]]], [C22, [Any, [Mu]]]])
$obj_c.+f; # A B1 C11 C12 B2 C21 C22
say $obj_c.*g.perl; # undef
try {
    say $obj_c.+g;
}
say $!;

# 深さ優先探索？
# A -+- B1 -+- C11
#    |      +- C12
#    |
#    +- B2 -+- C21
#           +- C22

# role は，継承しないクラスみたいなもんか

# class から継承できない
# role のメソッド名の重複は同じ階層だと解決しないと駄目
# role のsuper に同名メソッドがある場合は上書きされる．
# role に型パラメータを付けることもできる
# クラスのメソッドは同名のrole のメソッドを隠す．第二級市民
# ロールのメソッドは同名の継承されたクラスのメソッドを隠す．第三級市民
# ロールは，+method できないので，集約されているのだろう

{
    my role A { method f { say "A" } };
    my role B { method f { say "B" } };
    # Method 'f' collides and a resolution must be provided by the class
#    my class C does A does B { };
}

{
    my role A { method f { say "A" } };
    my role B does A { method f { say "B" } };
    my class C does B {  };
    # Method 'f' collides and a resolution must be provided by the class
    my $o = C.new;
    say 'WHAT ' ~ $o.WHAT;
    say 'parents ' ~ $o.^parents(:tree).perl;
    say 'roles ' ~ $o.^roles(:tree).perl;
    say 'role[0].f ' ~ $o.^roles[0].f;
    say 'self.role.f ' ~ $o.f;
    say 'methods ' ~ $o.^methods(:local).map({.name}).perl;
    say 'C.new ~~ A ' ~ ($o ~~ A) ~ ' ' ~ ($o.does(A));
    say 'C.new ~~ B ' ~ ($o ~~ B) ~ ' ' ~ ($o.does(B));
    say 'C.new ~~ C ' ~ ($o ~~ C) ~ ' ' ~ ($o.does(C));

    my $a = A.new;
    say 'A.new.WHAT ' ~ $a.WHAT;
    say '$a.f ' ~ $a.f;

    my class D does A { method f { say "D" } };
    my $d = D.new;
    $d.f;

    my class E { method f { say "E" } };
    my $e = E.new;
    say 'E does B = ' ~ ($e.does(B));
    say 'E when {:f} = ' ~ ($e when { :f });
    $e.f;

    my role F { multi method f { say "F" } };
    my role G { multi method f { say "G" } };
    my class H does F does G { };
    my class I does G does F { };
    my $h = H.new;
    $h.f;
    my $i = I.new;
    $i.f;
    G.f;
}

  #       A
  #       |
  #       C - B
  #       |
  # obj - E - D
{
    my class A { multi method f { say "A" } };
    my role B { multi method f { say "B" } };
    my class C is A does B { multi method f { say "C" } };
    my role D { multi method f { say "D" } };
    my class E is C does D { multi method f { say "E" } };
    my $e = E.new;
    say "E.f() is called";
    $e.+f;
}
  #       A
  #       |
  #       C
  #       |
  # obj - E - D - B # B を移動した
{
    my class A { multi method f { say "A" } };
    my role B { multi method f { say "B" } };
    my class C is A { multi method f { say "C" } };
    my role D { multi method f { say "D" } };
    my class E is C does D does B { multi method f { say "E" } };
    my $e = E.new;
    say "E.f() is called";
    $e.+f;
}

# rw のテスト
{
    my class A {
        has aaa $.a;
    };
    my $a = A.new;
    say "access A.a";
    say $a.^methods(:local)[0];
    $a.a = 10;
    say $a.perl;
}

{
    class C {};
    my $obj = C.new;
    say $obj.^methods(:local).map(*.name).perl;
    $obj.^add_method("a", my method a{});
    say $obj.^methods(:local).map(*.name).perl
}
