{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcutils,
  rosSystemPackages,
  substituteSource,
  urdf,
  urdfdom-headers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_parser";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros eigen3-cmake-module ];
  propagatedNativeBuildInputs = [ rcutils urdf urdfdom-headers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" ]; };
  buildInputs = [ ament-cmake-ros eigen3-cmake-module ];
  propagatedBuildInputs = [ rcutils urdf urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liborocos-kdl" "liborocos-kdl-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "240c84653d99e38b617a01ab9b9bc43aa25354a6";
        hash = "sha256-vZjZKMavYiEYaLkZeIp/2940oQwf+B6AwT+tGh1DY/c=";
      };
    };
  });
  meta = {
    description = "\n   The Kinematics and Dynamics Library (KDL) defines a tree structure\n   to represent the kinematic and dynamic parameters of a robot\n   mechanism. ";
  };
})
