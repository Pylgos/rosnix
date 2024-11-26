{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "behaviortree_cpp";
  version = "4.6.2-1";
  src = finalAttrs.passthru.sources."behaviortree_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ ament-index-cpp rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" "libzmq3-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "behaviortree_cpp" = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp_v4-release.git";
        rev = "12f5df55f5eb54f2893771d9f4e1942ae420768d";
        hash = "sha256-/wi43gC6qhFEXVP2DkkASIWNXY1t6kLMoiG+KaDm7DY=";
      };
    };
  });
  meta = {
    description = "This package provides the Behavior Trees core library.";
  };
})
