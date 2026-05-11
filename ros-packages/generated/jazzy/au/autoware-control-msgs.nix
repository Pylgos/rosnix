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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_control_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_control_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_control_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_control_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "bd140f8d4beabec75e1563313e43b70f2fa09513";
        hash = "sha256-76ceMNgji0ZlJhS92iSHujQakC6+xLSa1hbVum3ork0=";
      };
    };
  });
  meta = {
    description = "Autoware control messages package.";
  };
})
