# just to export config files as modules
{
  configuration = import ./configuration.nix;
  lima-init = import ./lima-init.nix;
  lima-runtime = import ./lima-runtime.nix;
}
