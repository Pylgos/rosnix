{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    geometry_tutorials = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
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
  src = sources.geometry_tutorials;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
}
