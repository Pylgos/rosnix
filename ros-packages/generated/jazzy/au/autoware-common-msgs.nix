{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
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
  pname = "autoware_common_msgs";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."autoware_common_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_common_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_common_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "2d06e48fd59c60fc228530c72e6f978adbfe54f5";
        hash = "sha256-z4s076zycDaEYuZ9g0kflXHD0aJYG3XPRNQo4qUdrPU=";
      };
    };
  });
  meta = {
    description = "Autoware common messages package.";
  };
})
