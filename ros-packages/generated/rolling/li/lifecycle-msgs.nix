{
  ament-cmake,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lifecycle_msgs";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."lifecycle_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "lifecycle_msgs" = substituteSource {
      src = fetchgit {
        name = "lifecycle_msgs-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "6c8489e5035ff70794cd7a96a0e79620758aca63";
        hash = "sha256-Nn1uJ+UhvbJpav8y2mYf4klrf7f//yER3mQCABGBxtI=";
      };
    };
  });
  meta = {
    description = "A package containing some lifecycle related message and service definitions.";
  };
})
