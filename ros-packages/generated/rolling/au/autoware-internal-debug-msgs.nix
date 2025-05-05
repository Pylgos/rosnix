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
  version = "1.8.1-2";
  src = finalAttrs.passthru.sources."autoware_internal_debug_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_internal_debug_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_internal_debug_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_internal_msgs-release.git";
        rev = "dfa85a3239da814c0b80e5efe64596bcfa0724bf";
        hash = "sha256-TjXOUVfvILf/8solaIMyQrWohWXlbm/2kCk1EOcNDDg=";
      };
    };
  });
  meta = {
    description = "Autoware internal debug messages package.";
  };
})
