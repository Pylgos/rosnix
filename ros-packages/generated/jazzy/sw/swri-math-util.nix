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
  version = "3.8.4-1";
  src = finalAttrs.passthru.sources."swri_math_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_math_util" = substituteSource {
      src = fetchgit {
        name = "swri_math_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "7bcc946f8a8acd22cad1752437442d4b601122d4";
        hash = "sha256-17sVXus7knVMYx00IZKHtkY4pnQV0KWQi29u7Un7JjM=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used math utility code.\n  ";
  };
})
