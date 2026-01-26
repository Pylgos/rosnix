{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gtest,
  ament-cmake-ros,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  cras-lint,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rcl,
  rclcpp,
  rclcpp-components,
  rcutils,
  rmw,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cras_cpp_common";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."cras_cpp_common";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ backward-ros builtin-interfaces rcl rclcpp rclcpp-components rcutils rmw tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "language-pack-en" "libboost-dev" "libexpected-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces rcl rclcpp rclcpp-components rcutils rmw tf2 tf2-geometry-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "language-pack-en" "libboost-dev" "libexpected-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-cmake-ros cras-lint geometry-msgs std-msgs tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "cras_cpp_common" = substituteSource {
      src = fetchgit {
        name = "cras_cpp_common-source";
        url = "https://github.com/ros2-gbp/cras_ros_utils-release.git";
        rev = "839d291ad8788e3697a248b4e66269cee0a96a41";
        hash = "sha256-1GBeFIWPOzsm6gHpGtwVWZ2alY5jIiuznDhiy/VLsso=";
      };
    };
  });
  meta = {
    description = "A Czech-army knife for ROS code written in C++.";
  };
})
