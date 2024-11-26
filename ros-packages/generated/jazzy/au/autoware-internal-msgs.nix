{
  ament-cmake-auto,
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
  pname = "autoware_internal_msgs";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."autoware_internal_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "autoware_internal_msgs" = substituteSource {
        src = fetchgit {
          name = "autoware_internal_msgs-source";
          url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
          rev = "f74baae445e0a1ec57de8d08ba468540b3f02002";
          hash = "sha256-DqEUabWDDD8N8YSpZyB/5hJgvPbmkMCKoY9SJgfh/Q4=";
        };
      };
    });
  };
  meta = {
    description = "Autoware internal messages package.";
  };
})
