{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
  unique-identifier-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_system_msgs";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_system_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_system_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "c59e61aa49ef9102a32705c08498c0a72b63daa5";
        hash = "sha256-tg+3Qs1Y5aZPV2nQBKyNnDDL++dWxm1KszOoYUIsJcA=";
      };
    };
  });
  meta = {
    description = "Autoware system messages package.";
  };
})
