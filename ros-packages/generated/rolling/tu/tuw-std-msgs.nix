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
  pname = "tuw_std_msgs";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_std_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_std_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "5653efbde12ba854573c674ec4e9f53e1d967a5a";
        hash = "sha256-FPhDfn8gJ8ZGVQ5wEJNKGx5+8IK2mLB5/+AxKJSj0dI=";
      };
    };
  });
  meta = {
    description = "The tuw_std_msgs package";
  };
})
