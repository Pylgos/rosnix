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
  version = "3.7.4-1";
  src = finalAttrs.passthru.sources."swri_math_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_math_util" = substituteSource {
      src = fetchgit {
        name = "swri_math_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "2fe2331a432353211de4f54f2ac2d4bd51d1333f";
        hash = "sha256-iHLcvsBfa5QVChTWYQqltOhiYBb4eDxiicooQY27hQA=";
      };
    };
  });
  meta = {
    description = "A package with commonly used math utility code.";
  };
})
