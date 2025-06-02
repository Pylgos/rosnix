{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mola-common,
  mola-yaml,
  mrpt-libgui,
  mrpt-libmaps,
  mrpt-libobs,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "mola_kernel";
  version = "1.8.0-1";
  src = finalAttrs.passthru.sources."mola_kernel";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ mola-common mola-yaml mrpt-libgui mrpt-libmaps mrpt-libobs ];
  passthru.sources = mkSourceSet (sources: {
    "mola_kernel" = substituteSource {
      src = fetchgit {
        name = "mola_kernel-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "1109c76da635c05bb0c41c1d13ea4549416f3430";
        hash = "sha256-6giI/8NcTj04hes/FSLRu7v7oKOrB/5yPWL+8zRDEZQ=";
      };
    };
  });
  meta = {
    description = "Fundamental C++ virtual interfaces and data types for the rest of MOLA modules";
  };
})
