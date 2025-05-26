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
  version = "3.7.6-1";
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
        rev = "e55db119a85e402b895368ce9f7d9704d45d25f8";
        hash = "sha256-3lm95TTDqEhOd7dgTFfJlomMPHSBYvHYQQUI9DeYmUo=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used system utilities.\n  ";
  };
})
