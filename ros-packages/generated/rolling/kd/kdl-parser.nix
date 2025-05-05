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
  version = "2.13.0-1";
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
        rev = "b8d27c864f0a8a3b9cfe72581763ab345e56fd91";
        hash = "sha256-OlkMT3r3c3utRXLVVLG4i804HMcdmAQE0TgR0gSsd7o=";
      };
    };
  });
  meta = {
    description = "\n   The Kinematics and Dynamics Library (KDL) defines a tree structure\n   to represent the kinematic and dynamic parameters of a robot\n   mechanism. ";
  };
})
