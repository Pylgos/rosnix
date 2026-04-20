{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pcl-conversions,
  pluginlib,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  yasmin,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "yasmin_pcl";
  version = "5.0.0-1";
  src = finalAttrs.passthru.sources."yasmin_pcl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ pcl-conversions pluginlib sensor-msgs yasmin ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pcl-conversions pluginlib sensor-msgs yasmin ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "yasmin_pcl" = substituteSource {
      src = fetchgit {
        name = "yasmin_pcl-source";
        url = "https://github.com/ros2-gbp/yasmin-release.git";
        rev = "1dceda54f3f185abb9df03eaaf6e32e6b41d0fe8";
        hash = "sha256-pA2pmWF4NQRelqt/9F6lwE8n533KZTv1mb53yv1Fj8Y=";
      };
    };
  });
  meta = {
    description = "PCL-based reusable YASMIN states for PointCloud2 conversion, file I/O, and filtering.";
  };
})
