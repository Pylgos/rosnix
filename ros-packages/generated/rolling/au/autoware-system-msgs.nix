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
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."autoware_system_msgs";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces diagnostic-msgs geometry-msgs nav-msgs rosidl-default-generators rosidl-default-runtime std-msgs unique-identifier-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_system_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_system_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "8c4119d0e4859f5110ef5a72835a43d01c7e7dcd";
        hash = "sha256-nwxb2aYNAWF8d1PZZapf5bErGU0+/VbuPJPsscFGXA0=";
      };
    };
  });
  meta = {
    description = "Autoware system messages package.";
  };
})
