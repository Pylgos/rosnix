{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  autoware-common-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_localization_msgs";
  version = "1.12.0-1";
  src = finalAttrs.passthru.sources."autoware_localization_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ autoware-common-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ autoware-common-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_localization_msgs" = substituteSource {
      src = fetchgit {
        name = "autoware_localization_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "95ad396bb649a595d03c28d2edb82a21cbf81b95";
        hash = "sha256-Xvy6H0n2B8u6h5Gx8mjr5MDO7iwx78bO6h+KB54UfVc=";
      };
    };
  });
  meta = {
    description = "Autoware localization messages package.";
  };
})
