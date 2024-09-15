{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps_msgs,
  gps_tools,
  gpsd_client,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gps_umd = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "ff0f9cdec7713df9990a4d9ed38373f80998f00e";
        hash = "sha256-vIL98+Jzy8M+CuClxVCxEEDOOgpD+n26au28onECvQ0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gps_umd";
  version = "2.0.3-2";
  src = sources.gps_umd;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ gps_msgs gps_tools gpsd_client ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "gps_umd metapackage";
  };
}
