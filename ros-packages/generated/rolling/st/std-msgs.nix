{
  ament-cmake,
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
  pname = "std_msgs";
  version = "5.8.1-1";
  src = finalAttrs.passthru.sources."std_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "std_msgs" = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "248510c939901f57ac0bc1cfa69b50ed942276ca";
        hash = "sha256-RxfYL5/KJU8dxUsKMuO5PNLXIRvTqMs+YWF+UHFV78g=";
      };
    };
  });
  meta = {
    description = "A package containing some standard message definitions.";
  };
})
