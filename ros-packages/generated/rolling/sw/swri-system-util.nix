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
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_system_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-index-cpp ];
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_system_util" = substituteSource {
        src = fetchgit {
          name = "swri_system_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "b72d92f99fa6084c4243fee1629cd511712a59a6";
          hash = "sha256-4akj4akovewW9cszjNTNqoVOLqOKFVHwrFkXoE5ECLM=";
        };
      };
    });
  };
  meta = {
    description = "A package with commonly used system utilities.";
  };
})
