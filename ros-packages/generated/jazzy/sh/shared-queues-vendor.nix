{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "shared_queues_vendor";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."shared_queues_vendor";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "shared_queues_vendor" = substituteSource {
      src = fetchgit {
        name = "shared_queues_vendor-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "eab0924a304e3c008bd6d3f2dc34b65c112b74b6";
        hash = "sha256-xXEVGaaP0igtXbzkzROAmlHrcKiTcraZ3h1jcASV/+Q=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
          to = "URL ${sources."shared_queues_vendor/ef7dfbf553288064347d51b8ac335f1ca489032a"}";
        }
      ];
    };
    "shared_queues_vendor/ef7dfbf553288064347d51b8ac335f1ca489032a" = substituteSource {
      src = fetchzip {
        name = "ef7dfbf553288064347d51b8ac335f1ca489032a-source";
        url = "https://github.com/cameron314/readerwriterqueue/archive/ef7dfbf553288064347d51b8ac335f1ca489032a.zip";
        hash = "sha256-tfF1cjjiVn/Di2rYUS7TAqD4ojx7x0eRHVyn/GG/7+Q=";
      };
    };
  });
  meta = {
    description = "Vendor package for concurrent queues from moodycamel";
  };
})
