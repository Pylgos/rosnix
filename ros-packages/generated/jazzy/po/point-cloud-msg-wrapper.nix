{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "point_cloud_msg_wrapper";
  version = "1.0.7-5";
  src = finalAttrs.passthru.sources."point_cloud_msg_wrapper";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "point_cloud_msg_wrapper" = substituteSource {
      src = fetchgit {
        name = "point_cloud_msg_wrapper-source";
        url = "https://github.com/ros2-gbp/point_cloud_msg_wrapper-release.git";
        rev = "fb047463b9aa30d35af541c7fa4472b2f01c3b1b";
        hash = "sha256-LiHXg+Jj7fMDItxqFAz8F5On1mitqVf18p4luIzXtWk=";
      };
    };
  });
  meta = {
    description = "A point cloud message wrapper that allows for simple and safe PointCloud2 msg usage";
  };
})
