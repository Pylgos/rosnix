{
  ament_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  urdf_launch,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    urdf_tutorial-f50ad9cf19409844dee10830671567cdfff72c98 = substituteSource {
      src = fetchgit {
        name = "urdf_tutorial-f50ad9cf19409844dee10830671567cdfff72c98-source";
        url = "https://github.com/ros2-gbp/urdf_tutorial-release.git";
        rev = "f50ad9cf19409844dee10830671567cdfff72c98";
        hash = "sha256-is2/qeO2wFsbEBxJ8Kf0u+3EkFtbejI8nZpazjXVziM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_tutorial";
  version = "1.1.0-2";
  src = sources.urdf_tutorial-f50ad9cf19409844dee10830671567cdfff72c98;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ urdf_launch ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package contains a number of URDF tutorials.";
  };
}
