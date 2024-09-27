{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  can_msgs,
  dataspeed_can_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rosbag2_cpp,
  std_msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "dataspeed_can_tools" = substituteSource {
      src = fetchgit {
        name = "dataspeed_can_tools-source";
        url = "https://github.com/DataspeedInc-release/dataspeed_can-release.git";
        rev = "37d4b1513e0e6b64b929f7f999d68c50f666646d";
        hash = "sha256-iOy4XcA419agySKLFUkW4yjGx9G+qhdkC0FlWsPFYc8=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "dataspeed_can_tools";
  version = "2.0.4-1";
  src = sources."dataspeed_can_tools";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ can_msgs dataspeed_can_msgs rclcpp rosbag2_cpp std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "CAN bus introspection";
  };
}
