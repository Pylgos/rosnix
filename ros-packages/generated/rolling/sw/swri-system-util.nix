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
  version = "3.7.5-1";
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
        rev = "b9a343206c8a1fbbd40f9e59580f71def48d8a29";
        hash = "sha256-r82Ls43Sasdc2+s9GBlA9Z/3ySHQ9zWnJfVFvWXDot8=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used system utilities.\n  ";
  };
})
