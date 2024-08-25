{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  rcpputils,
  rcutils,
  substituteSource,
  tinyxml2_vendor,
}:
let
  sources = rec {
    pluginlib = substituteSource {
      src = fetchgit {
        name = "pluginlib-source";
        url = "https://github.com/ros2-gbp/pluginlib-release.git";
        rev = "e8b556270ca67d5640214fb34d895a2ff5081689";
        hash = "sha256-ZIVIHw0nimqFqss8537p3ec6RbiUeWpREml5RkLqwdg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pluginlib";
  version = "5.4.2-2";
  src = sources.pluginlib;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp class_loader rcpputils rcutils tinyxml2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ];
  missingDependencies = [  ];
  meta = {
    description = "The pluginlib package provides tools for writing and dynamically loading plugins using the ROS build infrastructure. To work, these tools require plugin providers to register their plugins in the package.xml of their package.";
  };
}
