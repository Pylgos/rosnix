{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest-vendor,
  mcap-vendor,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_cpp";
  version = "1.0.3-2";
  src = finalAttrs.passthru.sources."data_tamer_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-cmake-gtest data-tamer-msgs gtest-vendor mcap-vendor rclcpp rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake-gtest data-tamer-msgs gtest-vendor mcap-vendor rclcpp rclcpp-lifecycle ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_cpp" = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "c709abab660301b71992661ff7373ddfda7cd2de";
        hash = "sha256-loz5sQ2XxAaHfI1+p9m0+aKi7wfdwnzpMbLkyL+Lu2A=";
      };
    };
  });
  meta = {
    description = "\n  DataTamer data logging library\n  ";
  };
})
