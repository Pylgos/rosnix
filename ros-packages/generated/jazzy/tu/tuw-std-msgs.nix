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
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."tuw_std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_std_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_std_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "1b08b029e1a0446734aee83ae5f84b8c6638647f";
        hash = "sha256-6yrRjjJqwCizgp6FuVroceBMVbbBNESzTp0pCAh22rw=";
      };
    };
  });
  meta = {
    description = "The tuw_std_msgs package";
  };
})
