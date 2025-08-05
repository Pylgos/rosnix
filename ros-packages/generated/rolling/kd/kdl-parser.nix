{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
buildAmentCmakePackage (finalAttrs: {
  pname = "kdl_parser";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."kdl_parser";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ orocos-kdl-vendor rcutils urdf urdfdom-headers ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "kdl_parser" = substituteSource {
      src = fetchgit {
        name = "kdl_parser-source";
        url = "https://github.com/ros2-gbp/kdl_parser-release.git";
        rev = "64e650cb1b1bdfaa2df9ff2233099a2529f05e5b";
        hash = "sha256-/Aci3LYJg81+8KD+X8+BRy3mYZ7DZ3nkNQNbeGiQyYY=";
      };
    };
  });
  meta = {
    description = "\n   The Kinematics and Dynamics Library (KDL) defines a tree structure\n   to represent the kinematic and dynamic parameters of a robot\n   mechanism. ";
  };
})
