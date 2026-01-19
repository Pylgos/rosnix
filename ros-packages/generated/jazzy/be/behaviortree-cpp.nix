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
  tinyxml2-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "behaviortree_cpp";
  version = "4.8.3-1";
  src = finalAttrs.passthru.sources."behaviortree_cpp";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "git" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp rclcpp ros-environment tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libsqlite3-dev" "libzmq3-dev" "tinyxml2" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "git" ]; };
  propagatedBuildInputs = [ ament-index-cpp rclcpp ros-environment tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libsqlite3-dev" "libzmq3-dev" "tinyxml2" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "behaviortree_cpp" = substituteSource {
      src = fetchgit {
        name = "behaviortree_cpp-source";
        url = "https://github.com/ros2-gbp/behaviortree_cpp_v4-release.git";
        rev = "05fbc2e678360f46ec35198b1a18f63f39be44f7";
        hash = "sha256-RGV1ruc8sJy6gFYwAl01QFNe6XMph/oKt79c8/QtOxo=";
      };
    };
  });
  meta = {
    description = "\n  This package provides the Behavior Trees core library.\n  ";
  };
})
