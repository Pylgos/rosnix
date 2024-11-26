{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "swri_math_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_math_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_math_util" = substituteSource {
        src = fetchgit {
          name = "swri_math_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "363bafe035c9c957140d9c593f8d04543b1aefae";
          hash = "sha256-7Tz49UJ5/aCgz0J73FqouSNfQvkBhH2+iWwJdYBnvog=";
        };
      };
    });
  };
  meta = {
    description = "A package with commonly used math utility code.";
  };
})
