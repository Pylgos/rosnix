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
  pname = "autoware_internal_debug_msgs";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."autoware_internal_debug_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_debug_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_debug_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "cbdc322bd45a1c10af77fd0ce52d17443ed38269";
        hash = "sha256-pSU7Rq4A+huZL7PeP+MutAPvmh17jKEC7HQgpplhzxA=";
      };
    };
  });
  meta = {
    description = "Autoware internal debug messages package.";
  };
})
