{
	description = "A library for communicating with TI-nspire calculators";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		flake-parts.url = "github:hercules-ci/flake-parts";
	};

	outputs = inputs@{flake-parts, ... }:
		flake-parts.lib.mkFlake {inherit inputs;} {
			systems = ["x86_64-linux"];
			perSystem = {pkgs, ...}: {
				packages.default = pkgs.stdenv.mkDerivation {
					pname = "libnspire";
					version = "1.0.0";
					src = ./.;
					outputs = ["out" "dev"];
					nativeBuildInputs = with pkgs; [ pkg-config libusb1 ];
				};
			};
		};
}
