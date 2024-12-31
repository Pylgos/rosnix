{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_airskin_msgs";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_airskin_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_airskin_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_airskin_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "546c6ce658935e751d8ac084cf4edb88fdc69b12";
        hash = "sha256-Fm6NbuJ+PY6sfo1mECKn1SVIMkqgQlVWhxeqHcN4mEc=";
      };
    };
  });
  meta = {
    description = "The tuw_airskin_msgs package";
  };
})
