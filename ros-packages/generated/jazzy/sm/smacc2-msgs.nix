{
  action-msgs,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "smacc2_msgs";
  version = "3.0.1-1";
  src = finalAttrs.passthru.sources."smacc2_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "smacc2_msgs" = substituteSource {
      src = fetchgit {
        name = "smacc2_msgs-source";
        url = "https://github.com/robosoft-ai/SMACC2-release.git";
        rev = "c9ef3a19bd44fb91b2e064d1a08971009ec3fe3f";
        hash = "sha256-YtXXHTLgwl3lB/8VkQeAWe24ovV/3b6SFnIz0c1PrGs=";
      };
    };
  });
  meta = {
    description = "Messages and services used in smacc2.";
  };
})
