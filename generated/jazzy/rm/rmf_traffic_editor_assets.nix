{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmf_traffic_editor_assets-7db843be7c149dc679fb7f112d273a756ab76f07 = substituteSource {
      src = fetchgit {
        name = "rmf_traffic_editor_assets-7db843be7c149dc679fb7f112d273a756ab76f07-source";
        url = "https://github.com/ros2-gbp/rmf_traffic_editor-release.git";
        rev = "7db843be7c149dc679fb7f112d273a756ab76f07";
        hash = "sha256-hvm0OpnlRfng+KymFmP2C7+TLhgh/Tf2X7VmfiKfE6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_traffic_editor_assets";
  version = "1.9.1-1";
  src = sources.rmf_traffic_editor_assets-7db843be7c149dc679fb7f112d273a756ab76f07;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Assets for use with traffic_editor.";
  };
}
