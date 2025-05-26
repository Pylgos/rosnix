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
  version = "1.8.0-1";
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
        rev = "443ff99d6b84d08ab249d53c1f7aaf1777420c3c";
        hash = "sha256-sjFgGv4OEIufP+fTmQwP87tZlBAb1z0jwaJ3Nv8k8d0=";
      };
    };
  });
  meta = {
    description = "Autoware common messages package.";
  };
})
