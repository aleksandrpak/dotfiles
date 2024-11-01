let
  atGoogle = (builtins.pathExists (./. + "~/.at_google"));
in
{
  inherit atGoogle;
  emptyGoogleList = list: if atGoogle then [ ] else list;
}
