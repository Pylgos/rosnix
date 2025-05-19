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
  version = "1.0.2-1";
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
        rev = "4c571e179917443e5fb8f7b4145b25e9e19bd7bf";
        hash = "sha256-eoO2hcUt/A3cm8/dB0lSGtd+nhaLdazWUZ6u5gznp4E=";
      };
    };
  });
  meta = {
    description = "\n  DataTamer data logging library\n  ";
  };
})
