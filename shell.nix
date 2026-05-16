{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  nativeBuildInputs =
    [ pkgs.nodejs_20 pkgs.beam.packages.erlang_28.elixir_1_19 ];
}
