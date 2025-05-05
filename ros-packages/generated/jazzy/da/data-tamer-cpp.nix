{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  data-tamer-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "data_tamer_cpp";
  version = "0.9.4-4";
  src = finalAttrs.passthru.sources."data_tamer_cpp";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ data-tamer-msgs mcap-vendor rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ data-tamer-msgs mcap-vendor rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "data_tamer_cpp" = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "5274316290956c5257fb416f790585cc9aa31cd6";
        hash = "sha256-2AzGQXKFYJAAluNZytnO9/Or37ZYidTyDew6IkPUyos=";
      };
    };
  });
  meta = {
    description = "\n  DataTamer data logging library\n  ";
  };
})
