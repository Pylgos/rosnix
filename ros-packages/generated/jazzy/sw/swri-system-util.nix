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
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "swri_system_util" = substituteSource {
      src = fetchgit {
        name = "swri_system_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "4a6630edd7c28d29d1a8d9918396c1f4e72be3c9";
        hash = "sha256-sJ3phNtzqpHT9VTtxeDIQlpYfETYGiUXjPQSRluy3eU=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used system utilities.\n  ";
  };
})
