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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_system_util";
  version = "3.7.4-1";
  src = finalAttrs.passthru.sources."swri_system_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "swri_system_util" = substituteSource {
      src = fetchgit {
        name = "swri_system_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "1d188ee0b2a775b66594e63c381c16abe4b2c22f";
        hash = "sha256-sJ3phNtzqpHT9VTtxeDIQlpYfETYGiUXjPQSRluy3eU=";
      };
    };
  });
  meta = {
    description = "A package with commonly used system utilities.";
  };
})
