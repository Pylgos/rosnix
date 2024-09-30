{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  orocos-kdl-vendor,
  rcutils,
  rosSystemPackages,
  substituteSource,
  urdf,
  urdfdom-headers,
}:
let
  sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "62e426bc35f02277867bdb8204444c055c6d0d85";
        hash = "sha256-0pqo6+kDyd4jq/rIh9aXBLrvipyDVHZKbj2VAlBvZ/g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "kdl_parser";
  version = "2.11.0-3";
  src = sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The Kinematics and Dynamics Library (KDL) defines a tree structure to represent the kinematic and dynamic parameters of a robot mechanism.";
  };
}
