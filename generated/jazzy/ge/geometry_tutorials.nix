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
    geometry_tutorials-41254d9691294b2097eb42a77f57209cf3b0329a = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-41254d9691294b2097eb42a77f57209cf3b0329a-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "41254d9691294b2097eb42a77f57209cf3b0329a";
        hash = "sha256-hUMh0tFMH1FtZeYHlz7Wkncd8L1/y8oODx+QYd54pls=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geometry_tutorials";
  version = "0.5.0-1";
  src = sources.geometry_tutorials-41254d9691294b2097eb42a77f57209cf3b0329a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
}
