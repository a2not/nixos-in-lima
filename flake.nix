{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixos-generators,
    ...
  }: {
    packages.x86_64-linux = {
      img = nixos-generators.nixosGenerate {
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./nixos/configuration.nix
        ];
        format = "raw-efi";
      };
    };
    packages.aarch64-linux = {
      img = nixos-generators.nixosGenerate {
        system = "aarch64-linux";
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        modules = [
          ./nixos/configuration.nix
        ];
        format = "raw-efi";
      };
    };
  };
}
